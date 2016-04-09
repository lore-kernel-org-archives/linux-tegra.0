From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v1] Enhance sign script
Date: Fri, 8 Apr 2016 19:11:32 -0700
Message-ID: <1460167893-10803-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

1. Add parameter <soc> to sign tegra124 bootimage. Previously it can only sign
   for tegra210
2. Automatically generated signed bct. A signed bct is needed during flashing.

Jimmy Zhang (1):
  Add more features

 samples/sign.sh | 115 +++++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 81 insertions(+), 34 deletions(-)

-- 
1.9.1
