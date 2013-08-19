From: Soeren Grunewald <soeren.grunewald-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] Add support for Tamonten NG.
Date: Mon, 19 Aug 2013 12:05:56 +0200
Message-ID: <1376906757-28185-1-git-send-email-soeren.grunewald@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi All,

This patch adds support for our new Tegra3 based Tamonten-NG processor =
module.

In addition to providing the BCT configuration that is common for all T=
egra30
Tamonten-NG-derived boards, add scripts to build images that can be fla=
shed
to eMMC for the TEC-NG board.

Alban Bedel (1):
  Add the Tamonten=E2=84=A2 NG Evaluation Carrier board

 ..._Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct.cfg | 240 +++++++++++++=
++++++++
 tegra30/avionic-design/tamonten-ng/tegra30.img.cfg |  22 ++
 tegra30/avionic-design/tec-ng/build.sh             |  27 +++
 3 files changed, 289 insertions(+)
 create mode 100644 tegra30/avionic-design/tamonten-ng/TamontenNG_Nanya=
_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct.cfg
 create mode 100644 tegra30/avionic-design/tamonten-ng/tegra30.img.cfg
 create mode 100755 tegra30/avionic-design/tec-ng/build.sh

--=20
1.8.3.1
