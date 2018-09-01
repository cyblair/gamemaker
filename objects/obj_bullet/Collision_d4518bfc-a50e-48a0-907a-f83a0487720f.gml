other.hp--;
with (other)    {
    if (damageReact != "")   {
        script_execute(damageReact);
    }
}
instance_destroy();

