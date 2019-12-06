From: Jon Hunter <jonathanh@nvidia.com>
Subject: stable request: 5.4.y: arm64: tegra: Fix 'active-low' warning for
 Jetson
Date: Fri, 6 Dec 2019 10:55:17 +0000
Message-ID: <16724779-0514-ca92-58b2-95f4e244c6f7@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: linux-tegra <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Hi Greg,

Please can you include the following device-tree fixes for 5.4.y that
are triggering some warnings on a couple of our Jetson platforms. This
is currently causing one of our kernel warnings tests to fail. Both of
these have now been merged into the mainline for v5.5-rc1.

commit d440538e5f219900a9fc9d96fd10727b4d2b3c48
Author: Jon Hunter <jonathanh@nvidia.com>
Date:   Wed Sep 25 15:12:28 2019 +0100

    arm64: tegra: Fix 'active-low' warning for Jetson Xavier regulator

commit 1e5e929c009559bd7e898ac8e17a5d01037cb057
Author: Jon Hunter <jonathanh@nvidia.com>
Date:   Wed Sep 25 15:12:29 2019 +0100

    arm64: tegra: Fix 'active-low' warning for Jetson TX1 regulator

Thanks
Jon

-- 
nvpublic
