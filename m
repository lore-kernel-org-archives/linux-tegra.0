From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: tegra: add clfvs function to Tegra114 support
Date: Fri, 15 Feb 2013 20:24:02 +0100
Message-ID: <CACRpkdYw1_uWrnNEPEmNHcJgbUv=pe6PEK3PCutgQF6rfQTx4Q@mail.gmail.com>
References: <1360621513-18814-1-git-send-email-rklein@nvidia.com>
	<5119829C.20400@wwwdotorg.org>
	<511A6EE8.7010301@nvidia.com>
	<511A8A46.2010701@nvidia.com>
	<511A8FCD.5080402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <511A8FCD.5080402-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 12, 2013 at 7:54 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 02/12/2013 11:30 AM, Rhyland Klein wrote:

>> After looking, the devicetree binding doc don't seem to list the valid
>> functions. This change adds a function, and the other groups similar
>> (blink, cec, ...) don't seem to be listed either. Is there something
>> else that should be changed in the binding doc that I am missing?
>
> Oh right, so they don't. They really should though, so could you please
> file an internal bug to get the list of function added.
>
> If there are groups missing from the list of valid groups, they should
> be added too.
>
> However, all that is unrelated to this patch series, so consider my
> previous Reviewed-by to apply to the series as-is.
>
> LinusW, I assume you will apply patch 1/2 to your pinctrl tree, and I'll
> apply patch 2/2 to the Tegra tree later.

OK I've picked this as one of my last things before the merge
window!

Thanks,
Linus Walleij
