From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: tegra-xusb: Correct lane mux options
Date: Tue, 27 Oct 2015 17:07:11 +0100
Message-ID: <CACRpkdZXnmMufmAmjK7SiRZeLE16FD17krCfH4YD5MQOPt5ZPw@mail.gmail.com>
References: <1444987441-25176-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1444987441-25176-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 16, 2015 at 11:24 AM, Jon Hunter <jonathanh@nvidia.com> wrote:

> The description of the XUSB_PADCTL_USB3_PAD_MUX_0 register in the Tegra124
> documentation implies that all functions (pcie, usb3 and sata) can be
> muxed onto to all lanes (pcie lanes 0-4 and sata lane 0). However, it has
> been confirmed that this is not the case and the mux'ing options much more
> limited. Unfortunately, the public documentation has not been updated to
> reflect this and so detail the actual mux'ing options here by function:
>
> Function:               Lanes:
> pcie1 x2:               pcie3, pcie4
> pcie1 x4:               pcie1, pcie2, pcie3, pcie4
> pcie2 x1 (option1):     pcie0
> pcie2 x1 (option2):     pcie2
> usb3 port 0:            pcie0
> usb3 port 1 (option 1): pcie1
> usb3 port 1 (option 2): sata0
> sata:                   sata0
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Patch applied with Stephen's ACK.

Yours,
Linus Walleij
