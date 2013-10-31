From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Thu, 31 Oct 2013 09:56:39 -0600
Message-ID: <52727DB7.9030109@wwwdotorg.org>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383203126-3243-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/31/2013 01:05 AM, Wei Ni wrote:
> Set full constraints during machine initialisation, so that the
> regulator_get() can get the dummy regulator if the regulator is
> physically present and enabled.
> Discussed this in the link:
> https://lkml.org/lkml/2013/10/8/40

Is this needed to fix some bug that'll be in 3.13 or earlier, or does it
just solve a problem that will only be exposed in new code that will
appear in 3.14 or later?

In other words, do I need to apply this for 3.13, or can I hold off
until after the merge window?

It'd be helpful if the commit description described which
driver/board/DT/commit/... was affected by this. That way, I'd know the
answer to my question just by reading the commit description.
