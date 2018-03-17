From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/5] Tegra Video Decoder patches for 4.17
Date: Sat, 17 Mar 2018 18:28:10 +0300
Message-ID: <cover.1521300358.git.digetx@gmail.com>
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
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello media maintainers,

I've been postponing sending out these patches for awhile because I was
waiting for a review for the Tegra memory controller patches that would
allow to reset VDE HW properly and was hoping that they will get into 4.17,
but it's getting quite late now and seems 4.18 is the best bet now for the
proper VDE reset. So here is a small patchset that addresses couple of
minor issues that I've spotted over time.

Dmitry Osipenko (5):
  media: staging: tegra-vde: Align bitstream size to 16K
  media: staging: tegra-vde: Silence some of checkpatch warnings
  media: staging: tegra-vde: Correct minimum size of U/V planes
  media: staging: tegra-vde: Do not handle spurious interrupts
  media: staging: tegra-vde: Correct included header

 drivers/staging/media/tegra-vde/tegra-vde.c | 63 ++++++++++++++++-------------
 1 file changed, 34 insertions(+), 29 deletions(-)

-- 
2.16.1
