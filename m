From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Fri, 1 Nov 2013 09:31:44 +0800
Message-ID: <52730480.6020607@nvidia.com>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com>
 <52727DB7.9030109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52727DB7.9030109-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/31/2013 11:56 PM, Stephen Warren wrote:
> On 10/31/2013 01:05 AM, Wei Ni wrote:
>> Set full constraints during machine initialisation, so that the
>> regulator_get() can get the dummy regulator if the regulator is
>> physically present and enabled.
>> Discussed this in the link:
>> https://lkml.org/lkml/2013/10/8/40
> 
> Is this needed to fix some bug that'll be in 3.13 or earlier, or does it
> just solve a problem that will only be exposed in new code that will
> appear in 3.14 or later?

Let me explain this patch.
I discovered this problem when I worked on lm90 driver.
When I appiled my lm90 power control patches (this patch still in
review), I found the lm90 will be probed failed on Ventana board,
because on this board, the lm90 regulator is physically present and
enabled, so the lm90 driver can't use regulator_get() to get regulator,
and if we didn't set this full contraints, it can't get the dummy
regulator either, then probe failed.
So I think it's better to applied this patch earliy, because this solve
the compatible issue between Mark's dumy regulator patches, device
driver and DT.

Thanks.
Wei.

> 
> In other words, do I need to apply this for 3.13, or can I hold off
> until after the merge window?
> 
> It'd be helpful if the commit description described which
> driver/board/DT/commit/... was affected by this. That way, I'd know the
> answer to my question just by reading the commit description.
> 
