From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] pinctrl: tegra: use signed bitfields for optional fields
Date: Mon, 16 Mar 2015 21:30:02 +0100
Message-ID: <b20f23a75058210e8521f014f130e306@agner.ch>
References: <1426377952-12383-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426377952-12383-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org
Cc: linus.walleij@linaro.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 2015-03-15 01:05, Stefan Agner wrote:
> Optional fields are set to -1 by various preprocessor macros. Make
> sure the struct fields can actually store them.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> This lead to a lot of warnings when compiling the Tegra pinctrl drivers
> using LLVM/clang:
> 
> drivers/pinctrl/pinctrl-tegra124.c:2048:2: warning: implicit truncation from
> 'int' to bitfield changes value from -1 to 63 [-Wbitfield-constant-conversion]
>         MIPI_PAD_CTRL_PINGROUP(dsi_b,   0x820, 1, CSI, DSI_B)
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/pinctrl/pinctrl-tegra124.c:1807:18: note: expanded from macro
> 'MIPI_PAD_CTRL_PINGROUP'
>                 .rcv_sel_bit = -1,                                      \
>                                ^~
> 
> However, I did not check if this could actually lead to an unintended
> pin configuration...

Stephen, what do you think about this? While I think the patch  is the
right thing to do, it could actually introduce nasty regressions (stuff
which was working due to  "accidentally" wrong pin configuration)...

I need to admit that I did not actually run a kernel with that patch.

--
Stefan
