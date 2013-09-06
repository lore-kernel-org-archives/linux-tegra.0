From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: throw the unique chip ID into the entropy
 pool
Date: Fri, 06 Sep 2013 13:09:22 -0600
Message-ID: <522A2862.9060607@wwwdotorg.org>
References: <1378394938-1551-1-git-send-email-linus.walleij@linaro.org> <5228DECA.4090601@wwwdotorg.org> <CACRpkdYVUC+MM2SC446k=HC=FwsJMtD6YQa9Hcu8C9eMKMdYng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYVUC+MM2SC446k=HC=FwsJMtD6YQa9Hcu8C9eMKMdYng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/06/2013 02:53 AM, Linus Walleij wrote:
> On Thu, Sep 5, 2013 at 9:43 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
...
>> Note that the UID value appears to be incorrect on anything other than
>> Tegra20; I'll file an internal bug to track that down.
> 
> Hm, that will not affect the kernel entropy pool so much, but
> the crypto driver is in trouble since that seems to be the only
> entropy it's using :-(

Well, it calls getnstimeofday() too, so there's presumably a small
amount of entropy there, unless tegra_aes_rng_reset() gets called at
predictable times, which is probably true.

> If it will return something like a constant, that is actually a quite
> valid case for initializing tmp[1] from the kernel entropy pool
> with get_random_bytes() instead of using UID.
> 
> I don't know if the Tegra AES needs that specific initializer
> though (it seems not). Shall I propose a patch?

That sounds reasonable. Perhaps Varun can comment?
