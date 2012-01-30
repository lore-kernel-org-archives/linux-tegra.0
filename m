From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 3/5] ARM: dt: tegra: add ADT7461 temperature sensor to
 paz00 device tree
Date: Mon, 30 Jan 2012 09:26:47 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178E12414D@HQMAIL01.nvidia.com>
References: <cover.1327776641.git.marvin24@gmx.de>
 <58e24ac63a8388bb9de6be0e75cea26a1af99195.1327776641.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58e24ac63a8388bb9de6be0e75cea26a1af99195.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Saturday, January 28, 2012 12:03 PM:
> Add the ADT7461 temperature monitoring IC which is connected via
> the DVC controller.

> diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts

> +		adt7461@4c {
> +			compatible = "adt7461";

Compatible should have a vendor prefix, so "adi,adt7461".

-- 
nvpublic
