From: Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v2 0/2] staging: nvec: ps2: fix touchpad operation
Date: Thu, 27 Oct 2016 17:22:07 +0300
Message-ID: <1477578154-21199-1-git-send-email-fercerpav@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: devel@driverdev.osuosl.org
Cc: Paul Fertser <fercerpav@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

Status quo on Toshiba ac100 (paz00) is that the integrated elantech touchpad is
detected as an ImPS/2 mouse and so it's kind of functional but advanced
synaptics configuration isn't available.

When only serio type is changed it leads to atkbd misdetecting the touchpad as
a keyboard. So first goes the commit that fixes this bug, then the serio type
change.

Paul Fertser (2):
  drivers: staging: nvec: remove bogus reset command for PS/2 interface
  Revert "staging: nvec: ps2: change serio type to passthrough"

 drivers/staging/nvec/nvec_ps2.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

-- 
2.7.0
