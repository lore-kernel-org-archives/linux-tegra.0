From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V19 1/7] i2c: tegra: sort all the include headers
 alphabetically
Date: Tue, 12 Feb 2019 21:42:19 +0300
Message-ID: <7143cefd-8c8f-e010-90db-5ac46aa96105@gmail.com>
References: <1549996081-6858-1-git-send-email-skomatineni@nvidia.com>
 <BYAPR12MB3398679040C6ED2E129CEBFBC2650@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398679040C6ED2E129CEBFBC2650@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "wsa@the-dreams.de" <wsa@the-dreams.de>, "peda@axentia.se" <peda@axentia.se>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

12.02.2019 21:32, Sowjanya Komatineni пишет:
> Please ignore all Patch V19 series. Will resend.
> 
> Dmitry/Thierry
> I am using below stable tags in commit message based on V18 feedback to get patch applied to old kernels
> Git send email considers whole text after Cc as email address and reports badly formatted address.
> 
> Is there any format that I should follow to specify kernel versions along with stable tag?
> 
> Cc: stable@vger.kernel.org # 4.4+
> Cc: stable@vger.kernel.org # 4.20+

You could ask send-email to not auto-include CC's from the commit message: 

git send-email --suppress-cc=all

Also see https://git-scm.com/docs/git-send-email#git-send-email---suppress-ccltcategorygt for more options.
