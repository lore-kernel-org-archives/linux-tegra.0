From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra baseline test results for v3.18-rc1
Date: Mon, 20 Oct 2014 17:48:01 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1410201747290.4472@utopia.booyaka.com>
References: <alpine.DEB.2.02.1410201415580.4472@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1410201415580.4472-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 20 Oct 2014, Paul Walmsley wrote:

> The 64MiB decrease in highmem is a bit mysterious.  Am thinking that it is 
> probably PCIe-related [...]

It's highmem-related - the CMA area now allocates from highmem.


- Paul
