From: Dan Willemsen <dwillemsen@nvidia.com>
Subject: Re: [PATCH 1/3 v4] usb: tegra20-ehci: Add devicetree support.
Date: Thu, 21 Jul 2011 14:27:13 -0700
Message-ID: <CA4DE74D.50C07%dwillemsen@nvidia.com>
References: <1311283067-18952-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1311283067-18952-1-git-send-email-achew@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Chew <AChew@nvidia.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "olof@lixom.net" <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Rhyland Klein <rklein>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 7/21/11 2:17 PM, "Andrew Chew" <achew@nvidia.com> wrote:
>From: Andrew Chew <achew@nvidia.com>
>
>Add code to try to get platform data information (register base, irq,
>modes, various tuning parameters) from device tree, if not present in
>board
>files.

This patch no longer gets the register base or irq, just the modes and
tuning parameters.

- Dan Willemsen

>Signed-off-by: Andrew Chew <achew@nvidia.com>
>Acked-by: Stephen Warren <swarren@nvidia.com>
>---
>Applied Olof Johansson's comments:
>- Use direct assignment when copying default config structs.
>- Use __devinitdata for static default config structs.
>- Don't compile the default config structs if CONFIG_OF is disabled, to
>avoid
>  a warning.
>
> .../devicetree/bindings/usb/tegra20-ehci.txt       |   27 +++
> drivers/usb/host/ehci-tegra.c                      |  189
>++++++++++++++++++++
> 2 files changed, 216 insertions(+), 0 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/usb/tegra20-ehci.txt

--
nvpublic
