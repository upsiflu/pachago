// custom-backend-task.ts
import kleur from "kleur";
import bcrypt from "bcryptjs";
kleur.enabled = true;
async function environmentVariable(name) {
  const result = process.env[name];
  if (result) {
    return result;
  } else {
    throw `No environment variable called ${kleur.yellow().underline(name)}

Available:

${Object.keys(process.env).slice(0, 5).join("\n")}`;
  }
}
async function hello(name) {
  return `147 ${name}!!`;
}
async function hashPassword(password) {
  return await bcrypt.hash(password, process.env.SMOOTHIES_SALT);
}
export {
  environmentVariable,
  hashPassword,
  hello
};
