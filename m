From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v5 0/5] efuse driver for Tegra
Date: Thu, 29 May 2014 13:22:57 -0600
Message-ID: <53878911.9090508@wwwdotorg.org>
References: <1401281677-32110-1-git-send-email-pdeschrijver@nvidia.com> <20140528061645.252c2fbc.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140528061645.252c2fbc.akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/28/2014 07:16 AM, Andrew Morton wrote:
> On Wed, 28 May 2014 15:54:32 +0300 Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> 
>> This driver allows userspace to read the raw efuse data.
> 
> The patchset uses an inexplicable mixture of "fuse" and "efuse".
> Given that the kernel already has a "fuse", it would be nice if
> this code could use "efuse" everywhere.

I didn't check every instance, but a mix of those two terms seems
reasonable. "fuse" is the type of HW object; it's a generic HW term that
exists outside the scope of this patch. While the conflict with Linux's
filesystem is unfortunate, it's a name collision that I think we'll
simply have to live with; it's not created by this patch. "efuse" is the
name of the Tegra module that hosts Tegra's fuses.
