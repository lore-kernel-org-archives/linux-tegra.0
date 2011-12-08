From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH v6 00/10] Add support for tegra30 and cardhu
Date: Thu, 8 Dec 2011 10:08:19 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1750B77A8A@HQMAIL01.nvidia.com>
References: <1323348254-29072-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1323348254-29072-1-git-send-email-pdeschrijver@nvidia.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Randy Dunlap <rdunlap@xenotime.net>, Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Gary King <gking@nvidia.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Thursday, December 08, 2011 5:44 AM:
> This patchset adds support for the tegra30 SoC and the cardhu development
> board.
> 
> Patchset is on top of linux-next and
> http://www.spinics.net/lists/linux-tegra/msg03016.html.

The series,

Acked-by: Stephen Warren <swarren@nvidia.com>
Tested-by: Stephen Warren <swarren@nvidia.com>

Tested:

Two separate branches:

* next-20111208, plus the patch linked above, plus this patch series.
* My local dev branch based on next-20111206, plus all the patches I've
  posted recently, plus this patch series.

In each branch, tested the following builds:

* Non-DT build, Tegra20 only:
  - Booted Harmony, root on SD, tested audio.
* DT build, Tegra20 only:
  - Booted Harmony, root on SD, tested audio only in my dev branch.
* DT build, Tegra20 and Tegra30 support:
  - Booted Harmony, root on SD, tested audio only in my dev branch.
  - Booted Cardhu to the point of attempting to mount a root FS.
* DT build, Tegra30 support only:
  - Booted Cardhu to the point of attempting to mount a root FS

-- 
nvpublic


