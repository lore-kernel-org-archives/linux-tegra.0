From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] ARM: tegra: PCIe: Provide 3.3V supply voltage
Date: Tue, 21 Feb 2012 09:12:48 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BD8BC300@HQMAIL01.nvidia.com>
References: <1329724647-15783-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329724647-15783-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Monday, February 20, 2012 12:57 AM:	
> To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: [PATCH v2] ARM: tegra: PCIe: Provide 3.3V supply voltage
> 
> The PCIe reference clock needs a 3.3V supply voltage to work properly.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

Please CC maintainers on patches.

It's a little odd that our downstream kernels have the same constraints
as mainline and they're wrong, but as you say this could be explained by
the bootloader fixing the issue, and/or nobody much using PCIe on Harmony.

Anyway, I checked the schematics, and as far as I can tell from the
schematic, this patch is indeed correct, so:

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
