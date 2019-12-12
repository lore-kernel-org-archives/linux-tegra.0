From: Dmitry Osipenko <digetx@gmail.com>
Subject: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
Date: Fri, 13 Dec 2019 00:25:33 +0300
Message-ID: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

Hello Thierry,

Commit [1] introduced a severe GPU performance regression on Tegra20 and
Tegra30 using.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.5-rc1&id=fa6661b7aa0b52073681b0d26742650c8cbd30f3

Interestingly the performance is okay on Tegra30 if
CONFIG_TEGRA_HOST1X_FIREWALL=n, but that doesn't make difference for
Tegra20.

I was telling you about this problem on the #tegra IRC sometime ago and
you asked to report it in a trackable form, so finally here it is.

You could reproduce the problem by running [2] like this
`grate/texture-filter -f -s` which should produce over 100 FPS for 720p
display resolution and currently it's ~11 FPS.

[2]
https://github.com/grate-driver/grate/blob/master/tests/grate/texture-filter.c

Previously I was seeing some memory errors coming from Host1x DMA, but
don't see any errors at all right now.

I don't see anything done horribly wrong in the offending commit.

Unfortunately I couldn't dedicate enough time to sit down and debug the
problem thoroughly yet. Please let me know if you'll find a solution,
I'll be happy to test it. Thanks in advance!
