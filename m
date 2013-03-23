From: Jay Agarwal <jagarwal@nvidia.com>
Subject: RE: PCIE: 32 bit prefetchable memory not getting programmed in BARs
Date: Sat, 23 Mar 2013 11:38:57 +0530
Message-ID: <C79B248886DD134989C8FF6B096A91AB91B375A1A0@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Hi All,

In my Graphics card, it has 4 memory requirement:

a. 32 bit non-prefetchable
b. 32 bit prefetchable
c. 64 bit non-prefetchable.
d. 64 bit prefetchable

And I see a is programmed in BAR0(offset 0x10), c in BAR3(offset 0x1C),=
 d in BAR1(offset 0x14) but b is not programmed anywhere.

So is it=A0 an expected behaviour?=20

With best,
Jay
