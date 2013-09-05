From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: throw the unique chip ID into the entropy
 pool
Date: Thu, 05 Sep 2013 13:43:06 -0600
Message-ID: <5228DECA.4090601@wwwdotorg.org>
References: <1378394938-1551-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378394938-1551-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/05/2013 09:28 AM, Linus Walleij wrote:
> This adds a hook at common late init to extract the 64 bits of
> chip-unique data and throw it into the entropy pool to make it
> more device-unique.
> 
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> Stephen: since I don't have the Tegra reference manual I don't
> know what "UID" means, but if it means "unique ID" then this
> patch should be relevant for initializing the entropy pool.

I believe that's what it means, although even the TRM doesn't actually say.

I'll try and remember to apply this after the merge window.

Note that the UID value appears to be incorrect on anything other than
Tegra20; I'll file an internal bug to track that down.
