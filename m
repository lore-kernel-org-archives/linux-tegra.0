From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/9] ARM: trusted_foundations: enable L2x0 cache via
 firmware_ops
Date: Tue, 19 Dec 2017 21:56:25 +0300
Message-ID: <31c34cba-f626-5c27-430e-de5edebad843@gmail.com>
References: <cover.1500510157.git.mirq-linux@rere.qmqm.pl>
 <1d12ea86cca40749731a594afc165830c0b2463d.1500510157.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1d12ea86cca40749731a594afc165830c0b2463d.1500510157.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 20.07.2017 03:29, Michał Mirosław wrote:
> Use firmware_ops to provide hook for cache initialization through
> Trusted Foundations firmware, as some writes need Secure mode.
> 
> Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> ---

I've tested this patch on my T30, which I ported to current linux-next, and it
works excellent. Michał, are you going to re-spin this patch?
