From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] ARM: tegra: cpuidle: Handle tick broadcasting within
 cpuidle core on Tegra20/30
Date: Sun, 24 Feb 2019 18:31:50 +0300
Message-ID: <7b706843-a2e1-18bf-bad0-987016fc504e@gmail.com>
References: <20190224152740.7305-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190224152740.7305-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

24.02.2019 18:27, Dmitry Osipenko пишет:
> Tegra20/30 drivers do not handle the tick_broadcast_enter() error which
> potentially could happen when CPU timer isn't permitted to be stopped.
> Let's just move out the broadcasting to the CPUIDLE core by setting the
> respective flag in the Tegra20/30 drivers. This patch doesn't fix any
> problem because currently tick_broadcast_enter() could fail only on
> ARM64, so consider this change as a minor cleanup.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Woops, this is not a clk-related patch.. please ignore this email. Will fix it in a moment.
