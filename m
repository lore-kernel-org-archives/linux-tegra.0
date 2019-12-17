From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v1 1/2] Bluetooth: hci_bcm: Add device-tree compatible for
 BCM4329
Date: Tue, 17 Dec 2019 08:40:21 +0100
Message-ID: <027DD19D-719E-490F-BDBC-D38939AA3F55@holtmann.org>
References: <20191215185253.14024-1-digetx@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191215185253.14024-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

> Driver supports BCM4329, but there is no device-tree compatible for
> that chip. Let's add it in order to allow boards to specify Bluetooth
> in theirs device-trees, in particular this is useful for NVIDIA Tegra20
> boards.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> drivers/bluetooth/hci_bcm.c | 1 +
> 1 file changed, 1 insertion(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel
