From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: moving the clock gating procedure to
 tegra_cpu_kill
Date: Wed, 02 Jan 2013 14:08:27 -0700
Message-ID: <50E4A1CB.7060601@wwwdotorg.org>
References: <1355970519-28200-1-git-send-email-josephl@nvidia.com> <1355970519-28200-2-git-send-email-josephl@nvidia.com> <50D34467.9000006@wwwdotorg.org> <1356083897.26029.187.camel@jlo-ubuntu-64.nvidia.com> <50D4D345.6030804@wwwdotorg.org> <20121223112540.GF16237@mudshark.cambridge.arm.com> <20121223121231.GA16580@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121223121231.GA16580-MRww78TxoiP5vMa5CHWGZ34zcgK1vI+I0E9HWUfgJXw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/23/2012 05:12 AM, Will Deacon wrote:
... [kexec on ARM SMP discussion]
> The best bet is probably to call disable_nonboot_cpus in machine shutdown,
> before sending the stop and subsequent kill. It's very similar to your
> initial suggestion, but without the #elif.
> 
> Does that work for you?

Yes, it does. I just sent a patch implementing that. Thanks.
