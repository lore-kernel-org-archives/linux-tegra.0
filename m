From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 2/2] nvc0: use SM35 ISA with GK20A
Date: Tue, 27 May 2014 16:03:02 +0900
Message-ID: <1401174182-2182-3-git-send-email-acourbot@nvidia.com>
References: <1401166783-24086-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1401166783-24086-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>, Ken Adams <KAdams@nvidia.com>, Terje Bergstrom <tbergstrom@nvidia.com>, Thierry Reding <treding@nvidia.com>
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org, gnurou@gmail.com, mesa-dev@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

GK20A is mostly compatible with GK104, but uses the SM35 ISA. Use
the GK110 path when this chip is detected.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h      |  2 +-
 src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp |  2 +-
 .../drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp       | 15 ++++++++++-----
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
index bbb89d97932e..f829aac0bcc2 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_driver.h
@@ -91,7 +91,7 @@ struct nv50_ir_prog_symbol
 #define NVISA_GF100_CHIPSET_C0 0xc0
 #define NVISA_GF100_CHIPSET_D0 0xd0
 #define NVISA_GK104_CHIPSET    0xe0
-#define NVISA_GK110_CHIPSET    0xf0
+#define NVISA_GK20A_CHIPSET    0xea
 #define NVISA_GM107_CHIPSET    0x110
 
 struct nv50_ir_prog_info
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
index b1f76cf80432..f69e6a183e19 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_nvc0.cpp
@@ -3027,7 +3027,7 @@ TargetNVC0::createCodeEmitterNVC0(Program::Type type)
 CodeEmitter *
 TargetNVC0::getCodeEmitter(Program::Type type)
 {
-   if (chipset >= NVISA_GK110_CHIPSET)
+   if (chipset >= NVISA_GK20A_CHIPSET)
       return createCodeEmitterGK110(type);
    return createCodeEmitterNVC0(type);
 }
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
index 064e7a2c63f9..963b6e47ddfc 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nvc0.cpp
@@ -49,9 +49,12 @@ TargetNVC0::getBuiltinCode(const uint32_t **code, uint32_t *size) const
 {
    switch (chipset & ~0xf) {
    case 0xe0:
-      *code = (const uint32_t *)&gk104_builtin_code[0];
-      *size = sizeof(gk104_builtin_code);
-      break;
+      if (chipset < NVISA_GK20A_CHIPSET) {
+         *code = (const uint32_t *)&gk104_builtin_code[0];
+         *size = sizeof(gk104_builtin_code);
+         break;
+      }
+      /* fall-through for GK20A */
    case 0xf0:
    case 0x100:
       *code = (const uint32_t *)&gk110_builtin_code[0];
@@ -71,7 +74,9 @@ TargetNVC0::getBuiltinOffset(int builtin) const
 
    switch (chipset & ~0xf) {
    case 0xe0:
-      return gk104_builtin_offsets[builtin];
+      if (chipset < NVISA_GK20A_CHIPSET)
+         return gk104_builtin_offsets[builtin];
+      /* fall-through for GK20A */
    case 0xf0:
    case 0x100:
       return gk110_builtin_offsets[builtin];
@@ -235,7 +240,7 @@ TargetNVC0::getFileSize(DataFile file) const
 {
    switch (file) {
    case FILE_NULL:          return 0;
-   case FILE_GPR:           return (chipset >= NVISA_GK110_CHIPSET) ? 255 : 63;
+   case FILE_GPR:           return (chipset >= NVISA_GK20A_CHIPSET) ? 255 : 63;
    case FILE_PREDICATE:     return 7;
    case FILE_FLAGS:         return 1;
    case FILE_ADDRESS:       return 0;
-- 
1.9.3
