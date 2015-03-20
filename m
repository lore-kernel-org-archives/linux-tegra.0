From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] ARM: trusted_foundations: Maintain CPU endianness
Date: Fri, 20 Mar 2015 18:47:18 +0300
Message-ID: <550C4106.4090801@gmail.com>
References: <1426865807-22981-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426865807-22981-1-git-send-email-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch not tested. I assume that firmware save/restore cp15 context, i.e. it 
doesn't require switching to LE before smc call and restore endianness after.

-- 
Dmitry
