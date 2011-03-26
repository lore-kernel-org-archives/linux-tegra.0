From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] tegra/mmc: add pm_flags
Date: Fri, 25 Mar 2011 17:28:10 -0700
Message-ID: <BANLkTinh2Z61+evk+Uu4xo2R43gTKHvxHg@mail.gmail.com>
References: <20110326000712.DD5D3208182@grundler.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <20110326000712.DD5D3208182@grundler.mtv.corp.google.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Grant Grundler <grundler@google.com>
Cc: Chris Ball <cjb@laptop.org>, Colin Cross <ccross@android.com>, Erik Gilling <konkers@android.com>, linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, grundler@chromium.org, vrao@broadcom.com
List-Id: linux-tegra@vger.kernel.org

[Gah, now without HTML formatting.]

On Fri, Mar 25, 2011 at 5:07 PM, Grant Grundler <grundler@google.com> wrote:
>
> Enable fast bcm4329 WIFI suspend/resume on Tegra2 board.
>
> This part allows the mach-tegra support tell the tegra MMC host controller
> to NOT turn off power for the MMC controller the WIFI part lives behind.
> Thus bcm4329 firmware doesn't need to be reloaded.
>
> Signed-off-by: Venkat Rao <vrao@broadcom>
> Tested-by: Grant Grundler <grundler@chromium.org>
> Reviewed-by: Olof Johansson <olofj@chromium.org>
> ----
> I'm not certain if this should go through tegra or mmc tree.
> Can you advise please?

Chris, please take it through the MMC tree.

Feel free to s/olofj@chromium.org/olof@lixom.net/ above, either way works.

-Olof
