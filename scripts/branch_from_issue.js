#!/usr/bin/node

const format = (issueStr) => issueStr
    ?.split(' ')
    .map(x => x.trim())
    .join('-')
    .replace(/_/g, '-')
    .replace(/'/g, '')
    .replace(/"/g, '')
    .replace(/-{2,}/g, '-')
    .replace(/ä/g, 'a')
    .replace(/ö/g, 'o')
    .toLowerCase();

const issue = process.argv[2];

if (!issue) {
    process.exit(1);
}

console.log(format(issue));
