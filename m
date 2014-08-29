From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] pinctrl: tegra20: Make of_device_id array const
Date: Fri, 29 Aug 2014 06:58:40 +0200
Message-ID: <CACRpkdYS3hnuShBQ-=fgY+A3XSsy9mUFfNq0mahOhUt6oNUwfg@mail.gmail.com>
References: <1407765791-3887-1-git-send-email-kiran.padwal21@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407765791-3887-1-git-send-email-kiran.padwal21-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kiran Padwal <kiran.padwal21-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 11, 2014 at 4:03 PM, Kiran Padwal <kiran.padwal21-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Make of_device_id array const, because all OF functions handle it as const.
>
> Signed-off-by: Kiran Padwal <kiran.padwal21-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied and squashed.

Yours,
Linus Walleij
