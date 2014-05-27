From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/2] nvc0: support for GK20A (Tegra K1)
Date: Tue, 27 May 2014 13:59:41 +0900
Message-ID: <1401166783-24086-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org, gnurou@gmail.com, mesa-dev@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

The following 2 patches make it possible to run Mesa programs on GK20A
(Tegra K1).

GK20A is very similar to GK104, but uses a new (backward-compatible) 3D class
as well as the same ISA as GK110 (SM35). Taking these differences into account
is sufficient to successfully render simple off-screen buffers.

Alexandre Courbot (2):
  nvc0: add GK20A 3D class
  nvc0: use SM35 ISA with GK20A

 src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h        |  1 +
 src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp   |  2 +-
 src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp | 13 +++++++++----
 src/gallium/drivers/nouveau/nv_object.xml.h                 |  1 +
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c              |  9 ++++++++-
 5 files changed, 20 insertions(+), 6 deletions(-)

-- 
1.9.3
