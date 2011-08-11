From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH] i2c: tegra: fix possible race condition after tx
Date: Thu, 11 Aug 2011 13:54:25 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04AEA24CFC@HQMAIL01.nvidia.com>
References: <1313093946-24559-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1313093946-24559-1-git-send-email-dianders@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Ben Dooks <ben-linux@fluff.org>, Vincent Palatin <vpalatin@chromium.org>, Rhyland Klein <rklein@nvidia.com>
Cc: Jean Delvare <khali@linux-fr.org>, Rakesh Iyer <riyer@nvidia.com>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Doug Anderson wrote at Thursday, August 11, 2011 2:19 PM:
> In tegra_i2c_fill_tx_fifo, once we have finished pushing all the bytes
> to the I2C hardware controller, the interrupt might happen before we
> have updated i2c_dev->msg_buf_remaining at the end of the function.
> Then, in tegra_i2c_isr, we will call again tegra_i2c_fill_tx_fifo
> triggering weird behaviour. This has been shown to happen under real
> conditions.
> 
> Signed-off-by: Doug Anderson <dianders@chromium.org>

Acked-by: Stephen Warren <swarren@nvidia.com>

It's worth pointing out that this patch supersedes a previous attempt to fix
the same problem, originally posted in https://lkml.org/lkml/2011/4/19/514,
if I'm understanding correctly.

-- 
nvpublic
