From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: RE: [PATCH v1 01/11] PM / devfreq: tegra30: Change irq type to
 unsigned int
Date: Mon, 24 Jun 2019 11:12:45 +0900
Message-ID: <20190624021245epcms1p5366dd98904dac95625dc2deb4b649cb1@epcms1p5>
References: <20190623214658.11680-2-digetx@gmail.com>
        <20190623214658.11680-1-digetx@gmail.com>
        <CGME20190623214841epcas5p161cceab51cb10d5146e57d49a696d5e5@epcms1p5>
Reply-To: myungjoo.ham@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623214658.11680-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

>IRQ numbers are always positive, hence the corresponding variable should
>be unsigned to keep types consistent. This is a minor change that cleans
>up code a tad more.
>
>Suggested-by: Thierry Reding <thierry.reding@gmail.com>
>Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>


Cheers,
MyungJoo
