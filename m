From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH v4 00/10] Add support for tegra30 and cardhu
Date: Fri, 11 Nov 2011 13:40:48 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17408058A8@HQMAIL01.nvidia.com>
References: <1321010541-31337-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1321010541-31337-1-git-send-email-pdeschrijver@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Friday, November 11, 2011 4:22 AM:
> This patchset adds support for the tegra30 SoC and the cardhu development
> board.

Tested-by: Stephen Warren <swarren@nvidia.com>

Tested:

Tegra20-only build, Tegra30-only build, Tegra20+Tegra30 build.

Booting on Tegra30/Cardhu: Tegra30-only build, Tegra20+Tegra30 build.

Booting on Tegra20/Seaboard, using DT and board files.

All testing based on next-20111111, plus Will Deacon's 3 reset patches
that this relies on.

I haven't actually looked at the patches yet.

-- 
nvpublic
