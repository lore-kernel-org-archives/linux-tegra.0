From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 5/5] arm64: tegra: enable SMMU for SDHCI and EQOS on T194
Date: Thu, 21 May 2020 16:31:07 -0700
Message-ID: <20200521233107.11968-6-vdumpa@nvidia.com>
References: <20200521233107.11968-1-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200521233107.11968-1-vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable SMMU translations for SDHCI and EQOS transactions on T194.

Signed-off-by: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra194.dtsi
index f7c4399afb55..706bbb439dcd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -59,6 +59,7 @@ ethernet@2490000 {
 			clock-names =3D "master_bus", "slave_bus", "rx", "tx", "ptp_ref";
 			resets =3D <&bpmp TEGRA194_RESET_EQOS>;
 			reset-names =3D "eqos";
+			iommus =3D <&smmu TEGRA194_SID_EQOS>;
 			status =3D "disabled";
=20
 			snps,write-requests =3D <1>;
@@ -457,6 +458,7 @@ sdmmc1: sdhci@3400000 {
 			clock-names =3D "sdhci";
 			resets =3D <&bpmp TEGRA194_RESET_SDMMC1>;
 			reset-names =3D "sdhci";
+			iommus =3D <&smmu TEGRA194_SID_SDMMC1>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout =3D
 									<0x07>;
 			nvidia,pad-autocal-pull-down-offset-3v3-timeout =3D
@@ -479,6 +481,7 @@ sdmmc3: sdhci@3440000 {
 			clock-names =3D "sdhci";
 			resets =3D <&bpmp TEGRA194_RESET_SDMMC3>;
 			reset-names =3D "sdhci";
+			iommus =3D <&smmu TEGRA194_SID_SDMMC3>;
 			nvidia,pad-autocal-pull-up-offset-1v8 =3D <0x00>;
 			nvidia,pad-autocal-pull-down-offset-1v8 =3D <0x7a>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout =3D <0x07>;
@@ -506,6 +509,7 @@ sdmmc4: sdhci@3460000 {
 					  <&bpmp TEGRA194_CLK_PLLC4>;
 			resets =3D <&bpmp TEGRA194_RESET_SDMMC4>;
 			reset-names =3D "sdhci";
+			iommus =3D <&smmu TEGRA194_SID_SDMMC4>;
 			nvidia,pad-autocal-pull-up-offset-hs400 =3D <0x00>;
 			nvidia,pad-autocal-pull-down-offset-hs400 =3D <0x00>;
 			nvidia,pad-autocal-pull-up-offset-1v8-timeout =3D <0x0a>;
--=20
2.26.2
