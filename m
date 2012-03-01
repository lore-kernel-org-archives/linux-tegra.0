From: Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH v4 5/9] tegra: i2c: Add I2C driver
Date: Thu, 01 Mar 2012 08:50:30 +0100
Message-ID: <4F4F2A46.5020407@denx.de>
References: <1330536689-9121-5-git-send-email-sjg@chromium.org>
	<1330536689-9121-6-git-send-email-sjg@chromium.org>
Reply-To: hs@denx.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-reply-to: <1330536689-9121-6-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: linux-tegra@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, Tom Warren <twarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hello Simon,

Simon Glass wrote:
> From: Yen Lin <yelin@nvidia.com>
> 
> Add basic i2c driver for Tegra2 with 8- and 16-bit address support.
> The driver requires CONFIG_OF_CONTROL to obtain its configuration
> from the device tree.
> 
> (Simon Glass: sjg@chromium.org modified for upstream)
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>

just for completeness (Acked your v2 patch) here again:

Acked-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
