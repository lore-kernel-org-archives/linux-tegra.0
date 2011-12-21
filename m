From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 5/5] Tegra driver updates for 3.3
Date: Wed, 21 Dec 2011 11:16:37 -0800
Message-ID: <CAOesGMj7aOwtVbvW=ror_BZLHZciFge+_=Gdou5i1Ltk+hBBfA@mail.gmail.com>
References: <CAOesGMgFCiMqGMA4mVFxKT7tQ_OK+XbAgwXrnvWKp=N2LAouKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgFCiMqGMA4mVFxKT7tQ_OK+XbAgwXrnvWKp=N2LAouKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 21, 2011 at 11:15 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Arnd,
>
> Please pull the below driver updates for tegra for 3.3. They are two
> device-tree-enablement related patches for i2c, I haven't seen acks
> from Ben on them but they are trivial and tegra-specific patches so I
> picked them up anyway.

Pasted in the wrong git request-pull output. Here is the correct one:


The following changes since commit dc47ce90c3a822cd7c9e9339fe4d5f61dcb26b50:

  Linux 3.2-rc5 (2011-12-09 15:09:32 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git for-3.3/drivers

Stephen Warren (2):
      i2c: tegra: Add __devinit/exit to probe/remove
      i2c: tegra: Support DVC controller in device tree

 drivers/i2c/busses/i2c-tegra.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)
