From: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: VDE for tegra124 ?
Date: Fri, 26 Jun 2020 16:20:08 +0200
Message-ID: <CABr+WTm79nGMahuudkZtB6nizP8mxwwi6o4r2LUuN8ykoTrONA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

I'm interested in having at least initial VDE support merged upstream
for tegra124 (not yet tested).
I was wondering if merging the dts part and the needed compatible
along with few fixes (2) would be enough to work with the current
userspace ? (libvdpau-tegra)

I plan to have it tried after 5.18-rc3 land and report.

Thanks for your advice.

(1) https://github.com/thierryreding/linux/commits/for-4.22/vde
(2) currently testing patches:
ae8cd25401f9 ARM: tegra: Enable SMMU for VDE on Tegra124
53e4822d773a staging: media: tegra-vde: Keep VDE in reset when unused
eb5b12a86651 staging: media: tegra-vde: Print out invalid FD
c28810efcb90 staging: media: tegra-vde: Support BSEV clock and reset
55266929b386 staging: media: tegra-vde: Properly mark invalid entries
3aae01ea407f ARM: tegra: Add BSEV clock and reset for VDE on Tegra30
f5e6a834c766 ARM: tegra: Add BSEV clock and reset for VDE on Tegra20
615bf7bab259 ARM: tegra: Enable VDE on Tegra124

-- 
-

Nicolas (kwizart)
