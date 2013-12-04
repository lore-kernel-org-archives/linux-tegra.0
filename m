From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v4 2/3] regulator: tps6586x: add and use correct voltage
 table
Date: Wed, 04 Dec 2013 15:17:59 +0100
Message-ID: <0983a0fa016faa5674834afad4472413@agner.ch>
References: <cover.1386108712.git.stefan@agner.ch>
 <127fe07e18665f93aa8d7c03e03164f1a049ddb6.1386108712.git.stefan@agner.ch>
 <20131204121424.GN29268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131204121424.GN29268@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: swarren@wwwdotorg.org, thierry.reding@gmail.com, dev@lynxeye.de, lee.jones@linaro.org, lgirdwood@gmail.com, kai.poggensee@avionic-design.de, sameo@linux.intel.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Am 2013-12-04 13:14, schrieb Mark Brown:
> On Tue, Dec 03, 2013 at 11:18:47PM +0100, Stefan Agner wrote:
>> Depending on the regulator version, the voltage table might be
>> different. Use version specific regulator tables in order to select
>> correct voltage table. For the following regulator versions different
>> voltage tables are now used:
> 
> Acked-by: Mark Brown <broonie@linaro.org>
> 
> I won't apply since I think that patch 3 needs to go along with this,
> unless people decide the regulator tree is the easiest way to merge.

I merged the dependent DT changes into that patch, so from my side,
patch 3 don't needs to go along with this...
