From: dudl@cypress.com
Subject: update cyapa_i2c_platfrom_data,
	remove relative mode supporting. (issue6902105)
Date: Thu, 28 Apr 2011 07:00:50 +0000
Message-ID: <90e6ba3fd225155e1504a1f51e79@google.com>
Reply-To: dudl@cypress.com, ccross@android.com, konkers@android.com,
	olof@lixom.net, linux@arm.linux.org.uk, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, micahc@google.com, dso@cypress.com,
	chromium-os-reviews@chromium.org, vb+kernel@google.com,
	msb@chromium.org, olofj@chromium.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ccross@android.com, konkers@android.com, olof@lixom.net, linux@arm.linux.org.uk, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: vb+kernel@google.com, msb@chromium.org, olofj@chromium.org, chromium-os-reviews@chromium.org
List-Id: linux-tegra@vger.kernel.org

Reviewers: ccross_android.com, konkers_android.com, olof_lixom.net,  
linux_arm.linux.org.uk, linux-tegra_vger.kernel.org,  
linux-arm-kernel_lists.infradead.org, linux-kernel_vger.kernel.org, Micah  
C, dudl, dso_cypress.com,

Description:
update cyapa_i2c_platfrom_data, remove relative mode supporting.

Change-Id: Ic9fb8f11c8a4343ff7746f6f885e26d22e773830
Signed-off-by: Du, Dudley <dudl@cypress.com>

R=ccross@android.com,konkers@android.com,olof@lixom.net,linux@arm.linux.org.uk,linux-tegra@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,micahc@google.com,dudl@cypress.com,dso@cypress.com
BUG=
TEST=test on kaen board

1. becasuse relative mode is removed from cyapa driver, so setting for using
relative or absolute mode are also removed in platform data.


Please review this at http://codereview.chromium.org/6902105/

SVN Base: http://git.chromium.org/git/kernel-next.git@chromeos-2.6.38

Affected files:
   M arch/arm/mach-tegra/board-seaboard.c


Index: arch/arm/mach-tegra/board-seaboard.c
diff --git a/arch/arm/mach-tegra/board-seaboard.c  
b/arch/arm/mach-tegra/board-seaboard.c
index  
090ae201153aa6fdb87f7095e9b43ec65aa183d9..b52eec18d314ec75bb4a551baf3b19fce0ad274a  
100644
--- a/arch/arm/mach-tegra/board-seaboard.c
+++ b/arch/arm/mach-tegra/board-seaboard.c
@@ -206,8 +206,6 @@ static struct cyapa_platform_data  
cyapa_i2c_platform_data = {
  	.flag				= 0,
  	.gen				= CYAPA_GEN2,
  	.power_state			= CYAPA_PWR_ACTIVE,
-	.use_absolute_mode		= false,
-	.use_polling_mode		= false,
  	.polling_interval_time_active	= CYAPA_ACTIVE_POLLING_INTVAL_TIME,
  	.polling_interval_time_lowpower	= CYAPA_LOWPOWER_POLLING_INTVAL_TIME,
  	.active_touch_timeout		= CYAPA_ACTIVE_TOUCH_TIMEOUT,
