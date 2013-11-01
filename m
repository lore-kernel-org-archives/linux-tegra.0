From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Fri, 01 Nov 2013 10:01:27 -0600
Message-ID: <5273D057.10505@wwwdotorg.org>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com> <52727DB7.9030109@wwwdotorg.org> <52730480.6020607@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52730480.6020607-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/31/2013 07:31 PM, Wei Ni wrote:
> On 10/31/2013 11:56 PM, Stephen Warren wrote:
>> On 10/31/2013 01:05 AM, Wei Ni wrote:
>>> Set full constraints during machine initialisation, so that the
>>> regulator_get() can get the dummy regulator if the regulator is
>>> physically present and enabled.
>>> Discussed this in the link:
>>> https://lkml.org/lkml/2013/10/8/40
>>
>> Is this needed to fix some bug that'll be in 3.13 or earlier, or does it
>> just solve a problem that will only be exposed in new code that will
>> appear in 3.14 or later?
> 
> Let me explain this patch.
> I discovered this problem when I worked on lm90 driver.
> When I appiled my lm90 power control patches (this patch still in
> review), I found the lm90 will be probed failed on Ventana board,
> because on this board, the lm90 regulator is physically present and
> enabled, so the lm90 driver can't use regulator_get() to get regulator,
> and if we didn't set this full contraints, it can't get the dummy
> regulator either, then probe failed.
> So I think it's better to applied this patch earliy, because this solve
> the compatible issue between Mark's dumy regulator patches, device
> driver and DT.

To be honest, I don't really understand the answer and I don't think
it's answering my question.

Anyway, Mark requested changes to the patch, so I'll wait for V2 anyway.
