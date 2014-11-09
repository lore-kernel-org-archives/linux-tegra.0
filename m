From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] set: check seek success
Date: Sun, 09 Nov 2014 02:04:53 +0100
Message-ID: <14992150720.2771.879d79c6f3490faa837fa11cb97f42bf@gmail.com>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de>
 <545E95B1.5030703@georgi-clan.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545E95B1.5030703-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On November 8, 2014 11:22:54 PM Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org> wrote:
> This could silently fail which leads to surprising behaviour.
>
> Found-by: Coverity Scan
> Signed-off-by: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
> ---
>  src/set.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

This clearly isn't a patch against the Linux kernel, so it'd be good to
clarify what repository it should be applied to so people don't have
to guess.

Thierry
