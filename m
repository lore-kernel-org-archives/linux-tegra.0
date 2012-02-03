From: Stephen Warren <swarren@nvidia.com>
Subject: Re: [PATCH v6 10/18] tegra: usb: fdt: Add additional
 device tree definitions for USB ports
Date: Fri, 3 Feb 2012 12:03:40 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178E5D2FF9@HQMAIL01.nvidia.com>
References: <1328288907-16725-11-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1328288907-16725-11-git-send-email-sjg@chromium.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry@theia.denx.de, Baren <vanbaren@cideas.com>, Tom Warren <TWarren@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Simon Glass wrote at Friday, February 03, 2012 10:08 AM:
> This adds clock references to the USB part of the device tree for U-Boot,
> and marks USB1 as supporting legacy mode (which we disable in the driver).
> 
> The USB timing information may vary between boards sometimes, but for
> now we hard-code it in C. This is because all current T2x boards use
> the same values, we will deal with T3x later and we first need to agree
> on the format for this timing information in the fdt and may in fact
> decide that it has no place there.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>

The has-legacy-mode property looks good to me.

The clock bindings need updating.

-- 
nvpublic
