From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] Update Nyan-Big pinmux from ChromeOS
Date: Mon, 09 Mar 2015 10:23:17 -0600
Message-ID: <54FDC8F5.6060408@wwwdotorg.org>
References: <1425672435-19031-1-git-send-email-daniels@collabora.com>	<54FA0EBB.3080208@wwwdotorg.org>	<CAPnjgZ0Uir9PZ1RWKCua0q0R6NMgGotqR7+jAkc_aJd1xTx4ew@mail.gmail.com>	<54FA1231.9000709@wwwdotorg.org> <1425915411.12254.0@mail.collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425915411.12254.0-u1PCbA9B4pYthqhpMEQ9fNBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/09/2015 09:36 AM, Daniel Stone wrote:
> Hi Stephen,
> Thanks for looking at this.
>
> On Fri, 6 Mar, 2015 at 8:46 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> wrote:
>> On 03/06/2015 01:42 PM, Simon Glass wrote:
>>
>>     On 6 March 2015 at 13:31, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
>>     <mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>> wrote:
>>
>>         Can you comment on this change? If the data currently in
>>         tegra-pinmux-scripts is wrong, where did it come from if not
>>         the ChromeOS kernel?
>>
>>     Sorry, I have no direct knowledge.
>>
>> Oh, I see the answer in the patch description:
>>
>>     commit 4a5373e4bd6477addd3764e25989f74d34eba8c6 Author: Simon
>>     Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org <mailto:sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>> Date: Tue Feb 3
>>     11:29:03 2015 +0100 Add support for Nyan-big Add support for
>>     Tegra124 Nyan-big. Pinmux is based on norrin with a single change
>>     for the reset GPIO.
>>
>> The need for Daniel's patch seems like a good reason not to base one
>> board's pinmux on another board, assuming they're identical...
>
> Indeed.
>
>> Daniel, have you confirmed that 100% of the data in your patch matches
>> that used by the ChromeOS kernel, such that there shouldn't be any
>> more fixes needed down the line?
>
> Actually, no, I hadn't. The diff is annoying to produce, as the format
> used in chromeos-3.10 is totally different (different pin naming scheme,
> aggregation of one entry to multiple nvidia,pins entries),

I guess this is roughly what your Perl script does, but in the past I've 
written one-off scripts to import our downstream DT files into the 
*.board format that tegra-pinmux-scripts uses, and then diff'd that. The 
advantage here is that I can then use the output with tegra-pinmux-scripts.

> but I managed
> to get a full diff with a blindingly horrible bit of Perl[0] (take
> chromeos-3.10 entries, map names -> numbers, map back from numbers to
> current upstream names, produce DT fragment), and then manually
> reconcile that back to tegra-pinmux-scripts to remove the delta.
>
> There is only a small delta remaining between the two after manually
> harmonising these. First, the nvidia,lock property was set downstream
> but t-p-s doesn't seem to have any facility for handling this - is that
> a problem?

Lock doesn't do anything that would functionally affect the pinmux 
assuming there are no SW bugs that come along and corrupt the pinmux 
registers later. All lock does is prevent any changes to that particular 
register/pin after the bit is set. Good for safety, but shouldn't have 
any impact.

 > Secondly, chromeos-3.10 used TEGRA_PIN_PULL_DOWN for rcv-sel
> being enabled, which just happened to map to 1 (ENABLED).

Yikes!

> And lastly,
> there are a number of entries in nyan-big.config which aren't present in
> the downstream config. If these entries are unneeded (presumably unused
> ... ?), should they be removed?

Typically I'd hope that every pin had an explicit configuration, so that 
we know we've actively avoided any conflicting settings. Do you have a 
list of the pins that aren't configured in the ChromeOS kernel but are 
in the updated tegra-pinmux-scripts config file?

> These patches are sitting in
> git://git.collabora.com/git/user/daniels/tegra-pinmux-scripts - I'll
> post them after myself & Tomeu have done some more testing on them, as
> there are a rather worrying amount of changes. I can do the same to
> Blaze as well, but that'll have to wait a couple of days as I don't
> actually have one on my desk.
>
> Cheers,
> Daniel
>
> [0]: It really is horrible, and is only intended to be throwaway.
> http://people.collabora.com/~daniels/tmp/reconcile-downstream-dt.pl
