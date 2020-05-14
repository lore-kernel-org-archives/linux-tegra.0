From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net/next] r8152: Use MAC address from device tree if
 available
Date: Thu, 14 May 2020 13:16:55 -0700 (PDT)
Message-ID: <20200514.131655.249413798024922962.davem@davemloft.net>
References: <20200514123848.933199-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20200514123848.933199-1-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: hayeswang@realtek.com, kuba@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 14 May 2020 14:38:48 +0200

> From: Thierry Reding <treding@nvidia.com>
> 
> If a MAC address was passed via the device tree node for the r8152
> device, use it and fall back to reading from EEPROM otherwise. This is
> useful for devices where the r8152 EEPROM was not programmed with a
> valid MAC address, or if users want to explicitly set a MAC address in
> the bootloader and pass that to the kernel.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Yep, that looks good, applied.

Thank you.
