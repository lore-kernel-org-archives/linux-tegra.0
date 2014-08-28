From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra114: Make of_device_id array const
Date: Thu, 28 Aug 2014 15:21:02 +0200
Message-ID: <CACRpkdYGtTAwLC40W6Lp9jE1dEumyWuVesvCH2=Ri5K9mqEaJA@mail.gmail.com>
References: <1407755870-439-1-git-send-email-kiran.padwal21@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407755870-439-1-git-send-email-kiran.padwal21-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kiran Padwal <kiran.padwal21-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 11, 2014 at 1:17 PM, Kiran Padwal <kiran.padwal21-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Make of_device_id array const, because all OF functions handle it as const.
>
> Signed-off-by: Kiran Padwal <kiran.padwal21-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Patch applied with Theirry's ACK.

I will squash all of these patches into *one* since it is one single
functional change.

Yours,
Linus Walleij
