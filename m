From: Stephen Warren <swarren@nvidia.com>
Subject: Re: [PATCH v2 1/4] ARM: dt: tegra: Enable device tree
 audio codec on PAZ00 board.
Date: Thu, 2 Feb 2012 12:40:03 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178E124B60@HQMAIL01.nvidia.com>
References: <1328213618-15870-1-git-send-email-leon@leon.nu>
	<1328213618-15870-2-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1328213618-15870-2-git-send-email-leon@leon.nu>
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
To: Leon Romanovsky <leon@leon.nu>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "lrg@ti.com" <lrg@ti.com>, "olof@lixom.net" <olof@lixom.net>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Cc: Marc Dietrich <marvin24@gmx.de>
List-Id: linux-tegra@vger.kernel.org

Leon Romanovsky wrote at Thursday, February 02, 2012 1:14 PM:
> This patch adds initial device tree support of ALC5632 sound codec and
> machine driver for PAZ00 board. The implementation is based on the WM8903 codec.

This patch description seems a little unclear, since this is just adding
the .dts changes to instantiate the drivers that already support DT, and
mentioning WM8903 is a little confusing, since that's more relevant to
the commit where you wrote the binding docs and implemented the driver
changes.

Aside from that, the series,

Acked-by: Stephen Warren <swarren@nvidia.com>

-- 
nvpublic
