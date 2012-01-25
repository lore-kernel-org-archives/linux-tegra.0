From: Stephen Warren <swarren@nvidia.com>
Subject: Re: [PATCH 2/3] ARM: tegra: Enable the headphone
 detection gpio on PAZ00 board.
Date: Wed, 25 Jan 2012 14:23:58 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB821B4@HQMAIL01.nvidia.com>
References: <1327517420-29746-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1327517420-29746-1-git-send-email-leon@leon.nu>
Content-Language: en-US
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Leon Romanovsky <leon@leon.nu>, "lrg@ti.com" <lrg@ti.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "olof@lixom.net" <olof@lixom.net>, "ccross@android.com" <ccross@android.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
List-Id: linux-tegra@vger.kernel.org

Leon Romanovsky wrote at Wednesday, January 25, 2012 11:50 AM:
> Signed-off-by: Leon Romanovsky <leon@leon.nu>

> diff --git a/arch/arm/mach-tegra/board-paz00-pinmux.c b/arch/arm/mach-tegra/board-paz00-pinmux.c
...
> @@ -152,6 +152,7 @@ static struct tegra_gpio_table gpio_table[] = {
...
> +	{ .gpio = TEGRA_HP_DET,		.enable = true },

There's no need to do this at all if you're only supporting audio when
booting use device tree. If you intend for audio to work when booting
using a board file, then the previous patch needs a bunch of rework
to make some of the code conditional on device tree; the same structure
as tegra_wm8903.c uses.

Talking of which, in the previous patch, you can remove a number of
things from tegra_alc5632.c if you are only supporting device tree, like
the DAPM route map, since that's parsed from device tree now.

-- 
nvpublic
