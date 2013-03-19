From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/7] ARM: tegra: update device trees for USB binding rework
Date: Tue, 19 Mar 2013 13:53:55 -0600
Message-ID: <5148C253.6030007@wwwdotorg.org>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com> <1363609781-4045-3-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363609781-4045-3-git-send-email-vbyravarasu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Venu Byravarasu <vbyravarasu@nvidia.com>
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 06:29 AM, Venu Byravarasu wrote:
> This patch updates all Tegra board files so that they contain all the
> properties required by the updated USB DT binding. Note that this patch
> only adds the new properties and does not yet remove the old properties,
> in order to maintain bisectability. The old properties will be removed
> once the driver has been updated to assume the new bindings.
> 
> Signed-off-by: Venu Byravarasu <vbyravarasu@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra20-colibri-512.dtsi |    4 +++
>  arch/arm/boot/dts/tegra20-harmony.dts      |    8 +++---
>  arch/arm/boot/dts/tegra20-iris-512.dts     |    4 +++
>  arch/arm/boot/dts/tegra20-paz00.dts        |    8 +++---
>  arch/arm/boot/dts/tegra20-seaboard.dts     |   13 +++++++---
>  arch/arm/boot/dts/tegra20-trimslice.dts    |   12 +++++++---
>  arch/arm/boot/dts/tegra20-ventana.dts      |    7 +++--
>  arch/arm/boot/dts/tegra20.dtsi             |   32 +++++++++++++++++----------
>  8 files changed, 57 insertions(+), 31 deletions(-)

I think you forgot to update arch/arm/boot/dts/tegra20-whistler.dts in
this patch.
