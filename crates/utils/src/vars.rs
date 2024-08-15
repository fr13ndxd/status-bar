use lazy_static::lazy_static;
use std::sync::Mutex;

use crate::variable::*;

lazy_static! {
    pub static ref BAR_POSITION: Mutex<Variable<String>> =
        Mutex::new(Variable::new("top".to_string()));
    pub static ref TIME_FORMAT: Mutex<Variable<String>> =
        Mutex::new(Variable::new("%H:%M - %A %e.".to_string()));
}
