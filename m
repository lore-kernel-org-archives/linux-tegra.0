From: Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH v3 9/9] tegra: i2c: Enable I2C on Seaboard
Date: Fri, 10 Feb 2012 07:30:59 +0100
Message-ID: <4F34B9A3.7080408@denx.de>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
	<1328318041-10943-10-git-send-email-sjg@chromium.org>
Reply-To: hs@denx.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-reply-to: <1328318041-10943-10-git-send-email-sjg@chromium.org>
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
> This enables I2C on Seaboard.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> Changes in v3:
> - Use CONFIG_TEGRA_I2C instead of CONFIG_TEGRA2_I2C
> 
>  include/configs/seaboard.h |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)

Acked-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
