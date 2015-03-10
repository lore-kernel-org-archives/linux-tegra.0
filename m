From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] Update Nyan-Big pinmux from ChromeOS
Date: Tue, 10 Mar 2015 10:26:45 -0600
Message-ID: <54FF1B45.4030507@wwwdotorg.org>
References: <1425672435-19031-1-git-send-email-daniels@collabora.com>	<54FA0EBB.3080208@wwwdotorg.org>	<CAPnjgZ0Uir9PZ1RWKCua0q0R6NMgGotqR7+jAkc_aJd1xTx4ew@mail.gmail.com>	<54FA1231.9000709@wwwdotorg.org> <1425915411.12254.0@mail.collabora.com> <54FDC8F5.6060408@wwwdotorg.org> <loom.20150309T173610-946@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <loom.20150309T173610-946-eS7Uydv5nfjZ+VzJOa5vwg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/09/2015 10:40 AM, Daniel Stone wrote:
> Hi,
>
> Stephen Warren <swarren@...> writes:
>> On 03/09/2015 09:36 AM, Daniel Stone wrote:
>>> Actually, no, I hadn't. The diff is annoying to produce, as the format
>>> used in chromeos-3.10 is totally different (different pin naming scheme,
>>> aggregation of one entry to multiple nvidia,pins entries),
>>
>> I guess this is roughly what your Perl script does, but in the past I've
>> written one-off scripts to import our downstream DT files into the
>> *.board format that tegra-pinmux-scripts uses, and then diff'd that. The
>> advantage here is that I can then use the output with tegra-pinmux-
> scripts.
>
> Fair enough. I came into this hoping to spend rather less time on it than I
> did. ;)
>
>>> And lastly,
>>> there are a number of entries in nyan-big.config which aren't present in
>>> the downstream config. If these entries are unneeded (presumably unused
>>> ... ?), should they be removed?
>>
>> Typically I'd hope that every pin had an explicit configuration, so that
>> we know we've actively avoided any conflicting settings. Do you have a
>> list of the pins that aren't configured in the ChromeOS kernel but are
>> in the updated tegra-pinmux-scripts config file?
>
> Sure, I've attached it

That's quite a large list. I guess since ChromeOS works without 
configuring all those missing pins, we should probably not put 
values/configuration for those pins into tegra-pinmux-scripts. 
Otherwise, we can't know what values to set for any of those pins. I 
think missing information is better than present information that might 
be actively wrong.

That is, unless you want to extract the actual configuration that's 
programmed into HW from a running system, under the ChromeOS kernel. At 
least we'd then have a set of data that's 100% aligned with what's 
actually in use on production systems.

I wish the ChromeOS boards had had one of the NVIDIA syseng-supplied 
pinmux spreadsheets created. Then, we'd know exactly how everything was 
supposed to be configured, or even if there were bugs in the 
spreadsheet, at least have a single canonical source for the data, and 
source to fix.

>after having done Blaze as well (pushed to the same
> tree, totally untested in any way; Big at least boots and gives me
> USB/eMMC/eDP/HDMI). The only difference between the two is that Blaze does
> have a definition for kb_row11_ps[34]. I've not checked to see if these are
> actually required / in use, i.e. whether we do need them or if we're just
> getting lucky with existing/default configuration. I'll do this before I
> post the final patchset.

It's good the two boards are very similar. At least that corresponds 
well with them both having been derived from the same reference board.
