From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: don't timeout if CPU is powergated
Date: Thu, 13 Feb 2014 09:28:52 +0100
Message-ID: <4050206.sG2EzXyfMN@fb07-iapwap2>
References: <1d5ea6b7df4573d866779857922ac650fe59af60.1392078805.git.stefan@agner.ch> <52FBC97D.8040809@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52FBC97D.8040809-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, 12. Februar 2014, 12:20:29 schrieb Stephen Warren:
> On 02/10/2014 05:44 PM, Stefan Agner wrote:
> > When booting secondary CPU(s) which are not yet powergated, a wrong
> > check lead to a timeout after 100 jiffies. With this patch, we only
> > delay powergating if CPUs are still not powered yet.
> 
> I've applied this to Tegra's for-3.15/soc branch.

also for 3.14 and maybe lower versioned kernels? Since this seems to fix a bug 
where some core doesn't come up.

Marc
