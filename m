From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 1/6] resource: Add device-managed request/release_resource()
Date: Tue, 26 Aug 2014 10:53:35 -0600
Message-ID: <53FCBB8F.1040401@wwwdotorg.org>
References: <1409065898-26887-1-git-send-email-thierry.reding@gmail.com> <1409065898-26887-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409065898-26887-2-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08/26/2014 09:11 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Provide device-managed implementations of the request_resource() and
> release_resource() functions. Upon failure to request a resource, the
> new devm_request_resource() function will output an error message for
> consistent error reporting.

The series,
Tested-by: Stephen Warren <swarren@nvidia.com>
