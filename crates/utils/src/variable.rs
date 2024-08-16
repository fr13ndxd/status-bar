pub trait Var<T> {
    fn new(value: T) -> Self;
    fn get(&self) -> &T;
    fn set(&mut self, value: T);
    fn connect_changed<F>(&mut self, callback: F)
    where
        F: Fn(&T) + Send + Sync + 'static;
}

pub struct Variable<T> {
    value: T,
    callback: Option<Box<dyn Fn(&T) + Send + Sync>>,
}

impl<T: Clone> Var<T> for Variable<T> {
    fn new(value: T) -> Self {
        Variable {
            value,
            callback: None,
        }
    }

    fn get(&self) -> &T {
        &self.value
    }

    fn set(&mut self, value: T) {
        self.value = value.clone();
        if let Some(ref callback) = self.callback {
            callback(&value);
        }
    }

    fn connect_changed<F>(&mut self, callback: F)
    where
        F: Fn(&T) + Send + Sync + 'static,
    {
        self.callback = Some(Box::new(callback));
    }
}
